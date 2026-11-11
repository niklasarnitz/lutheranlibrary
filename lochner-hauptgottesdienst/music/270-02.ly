\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 270, printed p. 245.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key c \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { b'\breve a'\breve \bar "|" f'1 f'1 f'1 f'1 f'1 g'1 g'\breve f'1 f'1 f'\breve \bar "|" f'\breve e'\breve f'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t und "sprach:" Neh -- met hin und trin -- ket al -- le dar -- "aus." Die -- ser Kelch }
    \new PianoStaff <<
      \new Staff { \clef treble \global <e' gis' b'>\breve <c' e' a'>\breve \bar "|" <d' f'>1 r1 r1 r1 r1 r1 <e' g'>\breve r1 r1 <c' f'>\breve \bar "|" <d' f'>\breve <c' e'>\breve <c' f'>\breve }
      \new Staff { \clef bass \global e\breve a,\breve \bar "|" <d a>1 r1 r1 r1 r1 r1 <c c'>\breve r1 r1 <f a>\breve \bar "|" <bes, bes>\breve <c g>\breve <f, a>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
