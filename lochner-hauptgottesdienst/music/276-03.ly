\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 276, printed p. 251.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { f'1 g'1 a'1 a'1 bes'1 a'1 g'1 a'1 \bar "|" g'1 f'1 g'1 g'1 f'1 g'1 a'1 g'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Un -- ser täg -- lich Brod gib uns "heut." Und ver -- gib uns un -- sre Schul -- "den," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' f'>1 r1 r1 r1 <d' f' bes'>1 r1 r1 <c' f' a'>1 \bar "|" <d' g'>1 r1 r1 r1 r1 r1 <f' a'>1 <e' f' g'>\breve }
      \new Staff { \clef bass \global <d a>1 r1 r1 r1 bes,1 r1 r1 f1 \bar "|" <g, bes>1 r1 r1 r1 r1 r1 <f c'>1 <c c'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
