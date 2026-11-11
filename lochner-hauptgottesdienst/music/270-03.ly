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
      \new Voice = "melody" { f'1 f'1 f'1 f'1 f'1 f'1 f'1 g'1 g'\breve f'1 f'\breve \bar "|" f'1 f'1 f'1 f'1 f'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t ist das neu -- e Te -- sta -- ment in mei -- nem "†Blut," das für euch ver -- "gos-" }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' f'>1 r1 r1 r1 <d' f'>1 r1 r1 r1 <e' g'>\breve r1 <c' f'>\breve \bar "|" r1 r1 r1 r1 r1 }
      \new Staff { \clef bass \global <d a>1 r1 r1 r1 <bes, bes>1 r1 r1 r1 <c c'>\breve r1 <f, a>\breve \bar "|" r1 r1 r1 r1 r1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
